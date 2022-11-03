# Application

This is the application layer in our Domain Driven Design Architecture

This layer delegates the execution of business rules to the entities in the domain layer which will update the data within those domain entities.
This is achieved by use of the redux actions and view models that listen for any changes then updates the presentation layer.
It contains no domain-related logic or data access. It’s the only layer accessible to other bounded contexts.
