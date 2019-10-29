 Flutter news reader from [News API][newsapi].
====

 Glance implementation of news reader. App is able to receive news, update news list via pull to refresh and handle error and empty states.
 Used architecture approaches:
 - Clean architecture. Data, domain, presentation layers.
 - As a glue between domain and presentation layer unidirectional (some kind of MVI) uses. Instead of callbacks domain layer sends action objects to presentation layer. State (presentation layer) changes by some action from interactors (domain layer) by reducing incoming action data. Every widget has his own delegate that signals what exactly action will change widget internal state.
 
 Tech stack:
* [Dart][dart]
* [Flutter][flutter]

 Packages:
* [Cached network image][cached_network_image] - loading and caching images.
* [Equtable][equatable] - == and hashCode generator.
* [Http][http] - http client.
* [Json annotation][json_annotation] - annotations for data serialization.
* [Json_serializable][json_serializable] - json handling.

[newsapi]: https://newsapi.org
[dart]: https://dart.dev
[flutter]: https://flutter.dev
[cached_network_image]: https://pub.dev/packages/cached_network_image
[equatable]: https://pub.dev/packages/equatable
[http]: https://pub.dev/packages/http
[json_annotation]: https://pub.dev/packages/json_annotation
[json_serializable]: https://pub.dev/packages/json_serializable
