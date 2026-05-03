from std.math import iota
from std.sys import exit, has_accelerator

from std.gpu.host import DeviceContext
from std.gpu import block_dim, block_idx, thread_idx

comptime num_elements = 20

# UnsafePointer는 Mojo에서 C++ 스타일의 포인터 연산을 가능하게 하는 타입입니다.
# UnsafePointer는 Mojo의 안전한 메모리 모델을 우회하여 직접 메모리 주소를 다룰 수 있게 해줍니다.
# 이 예제에서는 GPU에서 벡터에 스칼라 값을 더하는 커널 함수를 구현하기 위해 UnsafePointer를 사용합니다.
def scalar_add(
    vector: UnsafePointer[Float32, MutAnyOrigin],
    size: Int,
    scalar: Float32,
):
    """
    Kernel function to add a scalar to all elements of a vector.

    This kernel function adds a scalar value to each element of a vector stored
    in GPU memory. The input vector is modified in place.

    Args:
        vector: Pointer to the input vector.
        size: Number of elements in the vector.
        scalar: Scalar to add to the vector.

    """

    # 전체 그리드 내에서 전역 스레드 인덱스를 계산합니다. 각 스레드는 벡터의 한 요소를 처리합니다.
    # block_idx.x: index of the current thread block.
    # block_dim.x: number of threads per block.
    # thread_idx.x: index of the current thread within its block.
    idx = block_idx.x * block_dim.x + thread_idx.x

    # 경계 검사: 벡터 크기를 초과하는 메모리 영역에 접근하지 않도록 합니다.
    # 이는 스레드 수가 벡터 크기와 정확히 일치하지 않을 때 특히 중요합니다.
    if idx < size:
        # 각 스레드는 해당 벡터 요소에 스칼라 값을 더합니다.
        # 이 연산은 모든 GPU 스레드에서 병렬로 수행됩니다.
        vector[idx] += scalar


def main() raises:
    comptime if not has_accelerator():
        print("No GPUs detected")
        exit(0)
    else:
        # DeviceContext는 GPU와의 상호작용을 관리하는 객체입니다.
        # GPU에서 커널 함수를 실행하려면 먼저 컨텍스트를 생성해야 합니다.
        ctx = DeviceContext()

        # 호스트(CPU) 메모리에 입력 데이터를 저장할 버퍼를 생성합니다.
        host_buffer = ctx.enqueue_create_host_buffer[DType.float32](
            num_elements
        )

        # GPU 작업은 비동기적으로 실행되므로, synchronize()를 호출하여
        # CPU가 GPU 작업이 끝날 때까지 대기하도록 합니다.
        ctx.synchronize()

        # iota() 함수는 주어진 범위에 연속된 값을 채우는 유틸리티 함수입니다.
        # 여기서는 0부터 시작하여 size-1 까지의 정수를 host_buffer에 채웁니다.
        iota(host_buffer.as_span())
        print("Original host buffer:", host_buffer)

        # Create a buffer in device (GPU) memory to store data for computation.
        # enqueue_create_buffer는 GPU 메모리에 버퍼를 할당하는 함수입니다.
        # 이 버퍼는 GPU에서 커널 함수가 읽고 쓸 수 있는 공간입니다.
        device_buffer = ctx.enqueue_create_buffer[DType.float32](num_elements)

        # Copy data from host memory to device memory for GPU processing.
        # enqueue_copy는 호스트와 디바이스 간에 데이터를 전송하는 함수입니다.
        ctx.enqueue_copy(src_buf=host_buffer, dst_buf=device_buffer)

        # Compile the scalar_add kernel function for execution on the GPU.
        # compile_function은 GPU에서 실행할 함수를 컴파일하는 함수입니다.
        scalar_add_kernel = ctx.compile_function[
            scalar_add, scalar_add
        ]()

        # 다음 인수를 사용하여 GPU 커널을 실행하십시오: 
        #
        # - device_buffer: GPU memory containing our vector data
        # - num_elements: number of elements in the vector
        # - Float32(20.0): the scalar value to add to each element
        # - grid_dim=1: use 1 thread block
        # - block_dim=num_elements: use 'num_elements' threads per block (one
        #   thread per vector element)
        # enqueue_function은 GPU에서 커널 함수를 실행하는 함수입니다. grid_dim과 block_dim을 설정하여
        # GPU에서 실행되는 스레드의 수와 구조를 정의합니다.
        ctx.enqueue_function(
            scalar_add_kernel,
            device_buffer,
            num_elements,
            Float32(20.0),
            grid_dim=1,
            block_dim=num_elements,
        )

        # Copy the computed results back from device memory to host memory.
        # enqueue_copy는 호스트와 디바이스 간에 데이터를 전송하는 함수입니다.
        ctx.enqueue_copy(src_buf=device_buffer, dst_buf=host_buffer)

        # GPU 작업은 비동기적으로 실행되므로, synchronize()를 호출하여
        # CPU가 GPU 작업이 끝날 때까지 대기하도록 합니다.
        ctx.synchronize()

        # Display the final results after GPU computation.
        print("Modified host buffer:", host_buffer)

        