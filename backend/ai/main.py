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

class Quiz(BaseModel):
  difficulty:str
  length: int
  type:str
  topic: str

class QuestionTrueFalse(BaseModel):
  question: str
  answer: bool

class TrueFalseQuiz(Quiz):
  questions: list[QuestionTrueFalse]

def generate_quiz(schema, difficulty,length,type,topic):
    response = client.models.generate_content(
        model="gemini-2.5-flash", contents=f"Generate a {type} quiz with a difficulty of {difficulty}, a length of {length}, and this topic {topic}",
        config = {"response_mime_type": "application/json", "response_schema": schema}
    )
    print(response.text)
    return response.text

def generate_true_false_quiz(difficulty,length,type,topic):
    return generate_quiz(TrueFalseQuiz,difficulty,length,type,topic)

class QuestionWrittenResponse(BaseModel):
  question:str

class WrittenResponseQuiz(Quiz):
   questions: list[QuestionWrittenResponse]

def generate_written_response_quiz(difficulty,length,type,topic):
    return generate_quiz(WrittenResponseQuiz,difficulty,length,type,topic)

class MultipleChoiceOption(BaseModel):
  value:str
  isCorrect:bool

class QuestionMultipleChoice(BaseModel):
   question: str
   option: list[MultipleChoiceOption]

class MultipleChoiceQuiz(Quiz):
   questions: list[QuestionMultipleChoice]

def generate_multiple_choice_quiz(difficulty,length,type,topic):
    return generate_quiz(MultipleChoiceQuiz,difficulty,length,type,topic)