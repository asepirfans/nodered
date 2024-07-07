# FROM nodered/node-red


# WORKDIR /data
# COPY package.json /data
# RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
# WORKDIR /usr/src/node-red

# COPY settings.js /data/settings.js
# COPY flows_cred.json /data/flows_cred.json
# COPY flows.json /data/flows.json

# CMD ["npm", "start", "--", "--userDir", "/data"]

FROM nodered/node-red

# Copy package.json to the WORKDIR so npm builds all
# of your added nodes modules for Node-RED
WORKDIR /data
COPY package.json /data
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production
WORKDIR /usr/src/node-red

# Copy your Node-RED project files into place
COPY settings.js /data/settings.js
COPY flows_cred.json /data/flows_cred.json
COPY flows.json /data/flows.json

# Copy entrypoint script and give execute permission
COPY entrypoint.sh /usr/src/node-red/entrypoint.sh
RUN chmod +x /usr/src/node-red/entrypoint.sh

# Expose port used by Node-RED
EXPOSE 1880

# Set entrypoint to the script
ENTRYPOINT ["sh", "/usr/src/node-red/entrypoint.sh"]
