from std.sys import has_accelerator

from std.gpu.host import DeviceContext
from std.gpu import block_dim, block_idx, global_idx, thread_idx

# 이 함수는 GPU에서 실행되는 커널 함수입니다.
# 각 GPU 스레드는 이 함수를 실행하여 자신의 블록 및 스레드 인덱스를 출력합니다.
def print_threads():
    """Print thread block and thread indices."""

    print(
        block_idx.x,
        block_idx.y,
        block_idx.z,
        thread_idx.x,
        thread_idx.y,
        thread_idx.z,
        global_idx.x,
        global_idx.y,
        global_idx.z,
        block_dim.x * block_idx.x + thread_idx.x,
        block_dim.y * block_idx.y + thread_idx.y,
        block_dim.z * block_idx.z + thread_idx.z,
        sep="\t",
    )

# GPU에서 실행되는 커널 함수는 일반적으로 void 반환형이지만,
# Mojo에서는 반환형을 명시하지 않아도 됩니다.
def main() raises:
    comptime if not has_accelerator():
        print("No compatible GPU found")
    else:
        # DeviceContext는 GPU와의 상호작용을 관리하는 객체입니다.
        # GPU에서 커널 함수를 실행하려면 먼저 컨텍스트를 생성해야 합니다.
        ctx = DeviceContext()

        print("block_idx\t\tthread_idx\t\tglobal_idx\t\tcalculated global_idx")
        print("x\ty\tz", "x\ty\tz", "x\ty\tz", "x\ty\tz", sep="\t")
        print("-" * 20, "-" * 20, "-" * 20, "-" * 20, sep="\t")

        # GPU에서 print_threads 커널 함수를 실행합니다. grid_dim과 block_dim을 설정하여
        # GPU에서 실행되는 스레드의 수와 구조를 정의합니다.
        ctx.enqueue_function[print_threads, print_threads](
            grid_dim=(2, 2, 1),  # 2x2x1 blocks per grid
            block_dim=(4, 4, 2),  # 4x4x2 threads per block
        )

        # GPU에서 커널 실행이 완료될 때까지 기다립니다. GPU 작업은 비동기적으로 실행되므로,
        # synchronize()를 호출하여 CPU가 GPU 작업이 끝날 때까지 대기하도록 합니다.
        ctx.synchronize()
        print("Done")