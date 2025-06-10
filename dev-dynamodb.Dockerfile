FROM amazon/dynamodb-local:2.6.1
WORKDIR /home/dynamodblocal
ENTRYPOINT ["java"]
CMD ["-jar" "DynamoDBLocal.jar" "-sharedDb"]
