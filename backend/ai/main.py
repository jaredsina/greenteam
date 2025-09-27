from google import genai
import os
from dotenv import load_dotenv
from pydantic import BaseModel

load_dotenv()

GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
# The client gets the API key from the environment variable `GEMINI_API_KEY`.
client = genai.Client(api_key = GEMINI_API_KEY)

class Schedule(BaseModel):
    title: str
    date: str
    startTime: int
    endTime: int

def generate_schedule(subject):
    response = client.models.generate_content(
        model="gemini-2.5-flash", contents=f"Generate a study schedule based on {subject}. Give date in the format YYYY-MM-DD.", config = {"response_mime_type": "application/json", "response_schema": list[Schedule]}
    )
    print(response.text)
    return response.text