import time
from os import environ

from tritonclient.grpc import InferenceServerClient, InferInput, InferRequestedOutput
from tritonclient.utils import np_to_triton_dtype
import numpy as np
import schedule


HOST = environ["GRPC_SERVER_HOST"]
PORT = environ["GRPC_SERVER_PORT"]


def generate_sample(num):
    return np.asarray(
        [[num for _ in range(16)]],
        dtype=np.int8
    )


def main():
    print('Hello from grpc-client')
    with InferenceServerClient(f'{HOST}:{PORT}') as client:
        inputs = [
            InferInput(
                name='INPUT0',
                shape=[1, 16],
                datatype=np_to_triton_dtype(np.int8)
            ),
            InferInput(
                name='INPUT1',
                shape=[1, 16],
                datatype=np_to_triton_dtype(np.int8)
            ),
        ]
        inputs[0].set_data_from_numpy(generate_sample(10))
        inputs[1].set_data_from_numpy(generate_sample(22))
        outputs = [
            InferRequestedOutput('OUTPUT0'),
            InferRequestedOutput('OUTPUT1'),
        ]
        try:
            response = client.infer(
                model_name='sample_model',
                inputs=inputs,
                # request_id=str(1),
                outputs=outputs
            )
            # print(response.get_response())
            print(response.get_output("OUTPUT0"))
            print(response.get_output("OUTPUT1"))
            print(response.as_numpy("OUTPUT0"))
            print(response.as_numpy("OUTPUT1"))
        except Exception as e:
            print(e)


if __name__ == '__main__':
    schedule.every(10).seconds.do(main)

    while True:
        schedule.run_pending()
        time.sleep(1)

