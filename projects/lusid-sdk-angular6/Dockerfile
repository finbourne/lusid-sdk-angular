FROM openjdk

# Get the swagger codegen
RUN wget https://oss.sonatype.org/content/repositories/releases/io/swagger/swagger-codegen-cli/2.3.1/swagger-codegen-cli-2.3.1.jar

# Generate the required code
RUN generate \
    -i https://api.finbourne.com/swagger/v0/swagger.json \
    -l typescript-angular \
    -o /local/$genRelDir
