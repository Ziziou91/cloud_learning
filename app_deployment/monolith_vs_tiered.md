# Monolith vs Tiered architecture

A monolithic architecture is a traditional model for computer applications where all parts of the system are organised as a single unit that is self-contained and independent from other applications. 

A tiered architecture is a approach that relies on 2 or more independently deployable services. Processes, such as business logic or a database occur independantly in each service.

While a monolithic architecture offers simplicity in development and deployment, a tiered architecture provides better scalability, flexibility, and resilience through its modular and loosely coupled design.

## Monolithic Architecture:

- **Single Unit**: In a monolithic architecture, the entire application is built as a single, indivisible unit.
- **Tightly Coupled Components**: All the components of the application, such as the user interface, business logic, and data access layers, are tightly coupled together.
- **Scalability Challenges**: Scaling a monolithic application can be challenging because the entire application needs to be scaled up or down together.
- **Deployment Complexity**: Deploying updates or new features to a monolithic application often requires deploying the entire application, which can lead to longer deployment times and increased risk.
- **Technology Stack**: Typically, a monolithic application uses a single technology stack for the entire application.

## Tiered Architecture:

**Separation of Concerns**: In a tiered architecture, the application is divided into multiple layers or tiers, each responsible for a specific aspect of the application.
**Loose Coupling**: The tiers in a tiered architecture are loosely coupled, meaning that changes to one tier can be made without necessarily impacting other tiers.
**Scalability**: Each tier can be scaled independently based on demand, which allows for more efficient resource utilization.
**Deployment Flexibility**: Updates or new features can be deployed to individual tiers without affecting the entire application, leading to shorter deployment times and reduced risk.
**Technology Diversity**: Different tiers in a tiered architecture can use different technology stacks, allowing teams to choose the most appropriate technologies for each component.
