import numpy
from fastapi import APIRouter
from fastapi.responses import JSONResponse

router = APIRouter()


@router.get('')
def hello_world() -> dict:
    return {'msg': 'Hello, World!'}

@router.get('/numpy')
def get_res():
    matrix_a = numpy.random.random_integers(0, 10, (10, 10))
    matrix_b = numpy.random.random_integers(0, 10, (10, 10))
    product = matrix_a.dot(matrix_b).tolist()
    return JSONResponse(content={
        'matrix_A': matrix_a.tolist(),
        'matrix_B': matrix_b.tolist(),
        'product': product,
    })
