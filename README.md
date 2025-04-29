# 📦 Dynamic Container

This project is built with **Flutter** using a **Clean Architecture**.
The project focuses on dynamic UI rendering based on data models, with robust state management using **BLoC**.

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/c3353702-6381-4bf4-8368-5206bbdf35de" width="22%" />
  <img src="https://github.com/user-attachments/assets/8dc57632-c265-4991-b9d1-d4fc4040c712" width="22%" />
  <img src="https://github.com/user-attachments/assets/67d12a84-d370-4980-bbbe-db0f21be0dcd" width="22%" />
  <img src="https://github.com/user-attachments/assets/81cdee72-2f77-4a7a-8c12-56ef26de02e6" width="22%" />

</p>


## 🔥 Features

- **Architecture**: Clean Architecture 
- **State Management**: BLoC 
- **Local Storage**: Shared Preference wrapper using abstract local-cache.
- **Service Locator**: GetIt
- **Asset Manager**: Spider
- **Dynamic UI Rendering**: Render UI from server-driven configurations.


## 🏗️ Project Structure

```tree
├── core
│   ├── debug_log
│   │   └── log.dart
│   ├── injection
│   │   └── injection.dart
│   ├── local_storage_service
│   │   ├── local_cache.dart
│   │   ├── shared_pref_storage.dart
│   │   └── storage_keys.dart
│   └── network_client
│       └── apis.dart
├── features
│   └── fam_container
│       ├── data
│       │   ├── data_source
│       │   │   └── fam_datasource.dart
│       │   ├── model
│       │   │   ├── bg_gradient_model.dart
│       │   │   ├── bg_image_model.dart
│       │   │   ├── card_model.dart
│       │   │   ├── cta_model.dart
│       │   │   ├── entity_model.dart
│       │   │   ├── formatted_text_model.dart
│       │   │   ├── hc_group_model.dart
│       │   │   └── ui_config_model.dart
│       │   └── repository_impl
│       │       └── fam_repository_impl.dart
│       ├── domain
│       │   ├── entity
│       │   │   ├── bg_gradient.dart
│       │   │   ├── bg_image.dart
│       │   │   ├── card.dart
│       │   │   ├── cta.dart
│       │   │   ├── entity.dart
│       │   │   ├── formatted_text.dart
│       │   │   ├── hc_group.dart
│       │   │   └── ui_config.dart
│       │   ├── repository
│       │   │   └── fam_repository.dart
│       │   └── usecase
│       │       └── fam_usecase.dart
│       └── presentation
│           ├── bloc
│           │   ├── fam_container_bloc.dart
│           │   ├── fam_container_event.dart
│           │   └── fam_container_state.dart
│           ├── components
│           │   ├── hc_group
│           │   │   ├── hc1_widget.dart
│           │   │   ├── hc3_widget.dart
│           │   │   ├── hc5_widget.dart
│           │   │   ├── hc6_widget.dart
│           │   │   └── hc9_widget.dart
│           │   └── shimmer.dart
│           ├── fam_dynamic_ui.dart
│           └── home_page.dart
├── global
│   ├── components
│   │   ├── loader.dart
│   │   └── parsed_richtext_widget.dart
│   └── design_system
│       ├── colors
│       │   └── colors.dart
│       └── sizing
│           └── sizing.dart
├── main.dart
├── resources
│   ├── images.dart
│   ├── resources.dart
│   └── svgs.dart
└── utils
    ├── extentions
    │   └── string_extenstions.dart
    └── helper_methods.dart
