FROM amazon/dynamodb-local:2.6.1
CMD ["/bin/bash"]
WORKDIR /home/dynamodblocal
ENTRYPOINT ["java"]
CMD ["-jar" "DynamoDBLocal.jar" "-sharedDb"]
