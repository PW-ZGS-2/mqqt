# Use official Eclipse Mosquitto image as base
FROM eclipse-mosquitto:latest

# Copy custom configuration file (if needed)
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Create directories for persistence and logs
RUN mkdir -p /mosquitto/data /mosquitto/log && \
    chown -R 1883:1883 /mosquitto

# Expose MQTT default ports
EXPOSE 1883
EXPOSE 9001

# Set default command
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]