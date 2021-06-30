extension BitReader on List<int> {
  int getBitOrZero(int position) {
    try {
      return this[position];
    } catch (_) {
      return 0;
    }
  }
}
