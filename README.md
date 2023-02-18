# flutter-clean-design-architecture

This Project describes a the clean design architecture pattern for flutter applications.

## Getting Started

### 1. Install dependencies
First, install the following packages
```yaml
dartz: ^0.10.1
bloc: ^8.1.1
flutter_bloc: ^8.1.2
http: ^0.13.
```

### 2. Folder Structure
It is recomended to follow an feature pattern folder structure inside your project.

```shell
lib/
└── api_request_feature/
    ├── application/
    │   └── bloc/
    ├── domain/
    │   ├── entities/
    │   ├── failures/
    │   ├── repositories/
    │   └── usecases/
    ├── infrastructure/
    │   ├── data_sources/
    │   ├── exeptions/
    │   ├── models/
    │   └── repositories/
    └── presentation/
        ├── pages/
        └── widgets/
```