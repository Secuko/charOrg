import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/styles/styles.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

class MessagesPage extends ConsumerStatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _MessagesPageState();
}

class _MessagesPageState extends ConsumerState<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(
        title: "Сообщения",
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: [
            Card(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                title: Text(
                  "Михаил костров",
                  style: styles.mainTextTheme.titleSmall,
                ),
                subtitle: const Text("Сколько еще нужно?"),
                trailing: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: styles.baseColors.grey.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "1",
                    style: styles.mainTextTheme.labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                title: Text(
                  "Олег Краснов",
                  style: styles.mainTextTheme.titleSmall,
                ),
                subtitle: const Text("Спасибо вам большое"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      color: Colors.grey, shape: BoxShape.circle),
                ),
                title: Text(
                  "Виктория Сумкина",
                  style: styles.mainTextTheme.titleSmall,
                ),
                subtitle: const Text(
                  "Привет! Нужна ваша помощь в ",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: styles.baseColors.grey.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "2",
                    style: styles.mainTextTheme.labelLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
