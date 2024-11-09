import pyautogui
import time

# Function to perform two left clicks
def click_twice():
    pyautogui.click()  # First click
    time.sleep(0.5)    # Short delay between clicks
    pyautogui.click()  # Second click
    time.sleep(5)    # Short delay between clicks
    pyautogui.click()
    time.sleep(0.5)    # Short delay between clicks
    pyautogui.click()
    time.sleep(5)    # Short delay between clicks
    pyautogui.click()
    time.sleep(0.5)    # Short delay between clicks
    pyautogui.click()

# Loop to click every 30 minutes
while True:
    click_twice()      # Perform two clicks
    time.sleep(600)   # Wait for xyz secs
