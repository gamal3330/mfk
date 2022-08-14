class ValueProvider {
  static int height = 175;
  static int weight = 40;
  static int age = 20;
  void setHeight(int newHeight) {
    height = newHeight;
  }

  void setWeight(int newWeight) {
    weight = newWeight;
  }

  void setAge(int newAge) {
    age = newAge;
  }

  int getWeight() {
    return weight;
  }

  int getHeight() {
    return height;
  }

  int getAge() {
    return age;
  }
}