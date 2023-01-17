# RickAndMorty
A sample app which utilizes [Get all characters](rickandmortyapi.com/api/character) to display a user list.
### Architecture
*MVVM (Model-View-ViewModel) + Coordinator

### Built With
* Swift, RxSwift, UIKit + UI as code
* Dependency Injection - Swinject
* Network - URLSession, JSONDecoder
* Tests - XCTestCase

### Good practices followed
* Single responsibility of solid principle
* Dependency inversion principle
* DRY principles
* Clean architecture

##### Commit strategy
* Commit for each unit code
* Single-Purpose Commits

### If future-proof
In the project all layers are abstract, which allows to organize dependency flow, it is also easier for testing and preferable for scalable applications.

### Additional info
For continuing development proccess in case of server issue, in the project implemented layer for displaying mock data, which allows developer and QA spetialist continue process and reach necessary screen without any problem

### Time it took
It took a full development day, development process was without strasess.

