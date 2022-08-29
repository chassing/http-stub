import os
import socket
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return f'{os.environ.get("INSTANCE_NAME", "no-name")} on {socket.gethostname()}'


@app.get("/healthz")
async def healthz():
    return "Ok"
