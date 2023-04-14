from fastapi import FastAPI
from datetime import datetime

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/health")
async def root():
    return {"status": "OK", "date": datetime.utcnow().isoformat()}