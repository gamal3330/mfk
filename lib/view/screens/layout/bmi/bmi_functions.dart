double findBMI(height, weight) {
  double heightInMeter = height / 100;
  double bmi = weight / (heightInMeter * heightInMeter);
  return bmi;
}

String getResponse(bmi) {
  String response = "الوزن الطبيعي";
  if (bmi <= 18.5) {
    response = "نحافة";
  } else if (bmi > 18.5 && bmi <= 24.9) {
    response = "وزن مثالي";
  } else if (bmi >= 25 && bmi <= 29.9) {
    response = "زيادة الوزن";
  } else {
    response = "بدانة";
  }
  return response;
}