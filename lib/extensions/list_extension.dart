extension InsertBetweenElements<T> on List<T> {
  List<T> insertBetweenElements(T Function() elementFactory) {
    if (length < 2) {
      return this;
    }

    List<T> newList = map((e) => [e, elementFactory()]).expand((e) => e).toList();
    newList.removeLast();

    return newList;
  }
}
