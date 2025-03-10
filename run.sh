#!/bin/bash

# Function to create and activate virtual environment
create_and_activate_venv() {
    # Step 1: Create a virtual environment if it doesn't exist
    if [ ! -d "venv" ]; then
        echo "Creating a virtual environment..."
        python -m venv venv
    else
        echo "Virtual environment already exists."
    fi

    # Step 2: Activate the virtual environment
    if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
        # For macOS/Linux
        echo "Activating virtual environment (Linux/macOS)..."
        source venv/bin/activate
    elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]] || [[ "$OSTYPE" == "win64" ]]; then
        # For Windows
        echo "Activating virtual environment (Windows)..."
        .\venv\Scripts\activate
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
}

# Function to upgrade pip to the latest version
upgrade_pip() {
    echo "Upgrading pip..."
    pip install --upgrade pip
}

# Function to install required dependencies from requirements.txt
install_requirements() {
    echo "Installing required dependencies..."
    pip install -r requirements.txt
}

# Function to run the FastAPI app using uvicorn
run_app() {
    echo "Starting the FastAPI app..."
    uvicorn app.app:app --reload
}

# Main script execution

# Step 1: Create and activate the virtual environment
create_and_activate_venv

# Step 2: Upgrade pip
upgrade_pip

# Step 3: Install dependencies
install_requirements

# Step 4: Run the FastAPI app
run_app
