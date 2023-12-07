# Connect
FROM amazon/aws-lambda-nodejs:12 AS addConnectionHandler

ARG FUNCTION_DIR="/var/task"

COPY package.json .

RUN npm install && npm install typescript -g

COPY . .

RUN tsc

RUN mkdir -p ${FUNCTION_DIR}

CMD ["build/addConnection.handler"]

# Disconnect
FROM amazon/aws-lambda-nodejs:12 AS removeConnectionHandler

ARG FUNCTION_DIR="/var/task"

COPY package.json .

RUN npm install && npm install typescript -g

COPY . .

RUN tsc

RUN mkdir -p ${FUNCTION_DIR}

CMD ["build/removeConnection.handler"]

# Send Vendor
FROM amazon/aws-lambda-nodejs:12 AS broadcastToVendorsHandler

ARG FUNCTION_DIR="/var/task"

COPY package.json .

RUN npm install && npm install typescript -g

COPY . .

RUN tsc

RUN mkdir -p ${FUNCTION_DIR}

CMD ["build/broadcastToVendors.handler"]

# Get Vendors
FROM amazon/aws-lambda-nodejs:12 AS getVendorsHandler

ARG FUNCTION_DIR="/var/task"

COPY package.json .

RUN npm install && npm install typescript -g

COPY . .

RUN tsc

RUN mkdir -p ${FUNCTION_DIR}

CMD ["build/getVendors.handler"]