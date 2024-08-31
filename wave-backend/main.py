import subprocess
from fastapi import FastAPI

app = FastAPI()

@app.post("/start-stream/")
async def start_stream():
    # Replace with your command to process the stream
    command = [
        "ffmpeg",
        "-i", "rtmp://127.0.0.1:1935/live/stream1",  # Input stream from NGINX
        "-c:v", "libx264",                            # Video codec
        "-c:a", "aac",                                # Audio codec
        "-f", "flv",                                  # Format for RTMP or FLV
        "output.flv"                                  # Save to a file for testing
    ]
    subprocess.Popen(command)
    return {"status": "Stream processing started"}

@app.post("/stop-stream/")
async def stop_stream():
    subprocess.run(["pkill", "ffmpeg"])
    return {"status": "Stream processing stopped"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, port=8000)
