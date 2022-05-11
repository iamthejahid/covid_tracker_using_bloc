import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CovidCard extends StatelessWidget {
  final String country;
  final String totalConfirmed;
  final String totalDeath;
  final String totalRecovered;
  const CovidCard(
      {Key? key,
      required this.country,
      required this.totalConfirmed,
      required this.totalDeath,
      required this.totalRecovered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black,
      ),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: SizedBox(
                child: Text(
                  country,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 120,
              width: double.infinity,
              child: Center(
                child: Column(children: [
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      const Icon(
                        Icons.restore_outlined,
                        color: Colors.green,
                      ),
                      const Text(
                        " Total Recovered: ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        totalRecovered,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.medical_services_outlined,
                        color: Colors.orange,
                      ),
                      const Text(
                        " Total Confirmed: ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        totalDeath,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.yellow,
                      ),
                      const Text(
                        " Total Death: ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        totalDeath,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
