extension FicListExtension<T> on List<T> {
  Iterable<E> mapIndexed<E>(E Function(T item, int index) map) sync* {
    for (var index = 0; index < length; index++) {
      yield map(this[index], index);
    }
  }
}
