FROM apache/airflow:3.1.5
ADD requirements.txt .

# Install Python packages
RUN pip install apache-airflow==${AIRFLOW_VERSION} -r requirements.txt

# Install uv package manager
RUN pip install uv --upgrade

# Create uv cache directory with proper permissions
# /tmp is already writable, we just need to create our cache directory
RUN mkdir -p /tmp/.cache/uv && \
    chmod 777 /tmp/.cache/uv

# Set environment variables for uv
ENV UV_CACHE_DIR=/tmp/.cache/uv
ENV UV_SYSTEM_PYTHON=1
ENV UV_LINK_MODE=copy
ENV HOME=/tmp
