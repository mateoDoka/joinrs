# Joinrs Flutter Challenge

## Exercise

The scope of the exercise is to implement the job offer detail page of the Joinrs app.

### Context

The app is already set up with the necessary dependencies and the job offer list screen is already implemented.
The app is following the [BLoC pattern](https://bloclibrary.dev/#/gettingstarted) as state management solution.
The job offer list screen is tested with unit and widget tests.

This version of the app is using a [mock API](lib/repository/stub/job_offer_search_stub.dart) to fetch the list of stubbed job offers.
The API returns always the same job offer data with a delay of 300ms to simulate a real environment.

### Requirements

- Implement the [job offer detail screen](lib/features/job_offer_detail/view/job_offer_detail_page.dart) following the [design provided](https://www.figma.com/file/Ht02hRNko8qnHv4CO5GbTp/Exercise-Joinrs?type=design&node-id=3%3A1804&mode=dev&t=DJ3MI4R7ZRLaHZiu-1).
  - The job offer detail screen should be opened when tapping on a job offer in the list.
  - Implement the logic to fetch the job offer detail from the [mock API](lib/repository/stub/job_offer_detail_stub.dart).
  - The job offer detail screen should show a loading indicator while fetching the data.
  - The job offer detail feature should be implemented using the BLoC pattern.
  - The job offer detail screen should be tested with unit and widget tests.
- Add notes on your architectural decisions, assumptions and how you would improve the app if you had more time.

### How to submit your solution

- Clone this repository.
- Solve the exercise.
- Send us an archive with your solution through google drive or any other file sharing service. Mind to not include the `build` folder.

### Presentation

- We will ask you to present your solution and discuss your architectural decisions.
- We will ask you clarifying questions about your solution and your architectural decisions.
- We will ask you to refactor code or add new features to your solution in a pair programming fashion, so be prepared to write code during the presentation.

---

## Running the app 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Joinrs Flutter Challenge works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

