# Use an official lightweight Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables to keep Python from buffering logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /plant-ai-project
# Copy the rest of the application source code
COPY . .
# Install the application dependencies first to leverage Docker caching
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the application listens on (e.g., 8000)
EXPOSE 8000

# Switch to a non-root user for security compliance
RUN useradd --create-home appuser
USER appuser

# Define the command to run the application
CMD ["python", "project.py"]
