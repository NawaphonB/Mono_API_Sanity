@echo off
REM ================================
REM Activate Python virtual environment (optional)
REM ================================
REM If you are not using a virtual environment, skip this line.
REM Otherwise, replace the path below with your actual venv path:
REM call C:\path\to\venv\Scripts\activate

REM ================================
REM Run Robot Framework tests
REM ================================
robot -d "C:\Users\UsEr\Documents\GitHub\Mono_API_Sanity\Monoapi\results" "C:\Users\UsEr\Documents\GitHub\Mono_API_Sanity\Monoapi\tests\HC_Testcase.robot"

REM ================================
REM Send Google Chat notification based on results
REM ================================
python "C:\Users\UsEr\Documents\GitHub\Mono_API_Sanity\notification_hook.py"

exit