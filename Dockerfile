FROM python:3.10.4

RUN apt-get update -y && \
    apt-get install -y libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite-dev libxdamage1 libxrandr2 libgbm1 libasound2 && \
    useradd -ms /bin/bash playwright && \
    apt-get install -y sudo curl && \
    mkdir -p /home/playwright/sandbox && \
    adduser playwright sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chown playwright -R /home/playwright

WORKDIR /home/playwright
USER playwright
ENV PATH="/home/playwright/.poetry/bin:/home/playwright/.local/bin:${PATH}"

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p git python && \
    pip install ipython playwright && \
    playwright install

CMD ["tail", "-f", "/dev/null"]
