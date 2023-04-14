from fastapi import FastAPI
from datetime import datetime
import time

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/health")
async def root():
    return {"status": "OK", "date": datetime.utcnow().isoformat()}

@app.get("/slow")
async def root():
    time.sleep(10)
    return {"status": "OK", "date": datetime.utcnow().isoformat()}