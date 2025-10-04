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

def generate_schedule(subject, date, startTime, endTime):
    response = client.models.generate_content(
        model="gemini-2.5-flash", contents=f"Generate a study schedule based on {subject}. The date will be {date} between {startTime} and {endTime}. Give start time and end time for each session in hours as an integer 0-24. Make each appointment one hour long", config = {"response_mime_type": "application/json", "response_schema": list[Schedule]}
    )
    print(response.text)
    return response.text