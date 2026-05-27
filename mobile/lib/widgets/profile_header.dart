import 'package:flutter/material.dart';
import 'package:skillroot/services/theme.dart';
import 'package:skillroot/widgets/progress_bar.dart';
import 'package:skillroot/models/user.dart';
import 'package:skillroot/services/provider.dart';
import 'package:skillroot/models/job.dart';

class ProfileHeader extends StatefulWidget {
  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: provider.user,
      builder: (BuildContext context, AsyncSnapshot<User> p) {
        return Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(color: AppTheme.isLightTheme ? Color(0xff33354E) : Colors.black, borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: p.hasData && p.data != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(radius: 40, backgroundColor: Color(0xffD8D8D8)),
                          ),
                          Image.asset(ThemeStrings.v2, height: 30),
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${p.data!.firstName} ${p.data!.lastName}",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            FutureBuilder<List<Job>>(
                              future: provider.jobs,
                              builder: (BuildContext context, AsyncSnapshot<List<Job>> snapshot) {
                                String jobTitle = '';
                                if (snapshot.hasData && snapshot.data != null && snapshot.data!.length > 0) {
                                  jobTitle = snapshot.data![0].name;
                                }
                                return Text(jobTitle, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10, color: Colors.white));
                              },
                            ),
                            SizedBox(height: 10),
                            ProgressBar(progress: p.data!.completion),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Overall Progress", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 8, color: Colors.white)),
                                SizedBox(width: 10),
                                Text("${(p.data!.completion * 100).toStringAsFixed(0)}%", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 8, color: Colors.white)),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 25,
                              width: 130,
                              decoration: BoxDecoration(color: AppTheme.isLightTheme ? Colors.white : Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(ThemeStrings.t31, color: AppTheme.isLightTheme ? Theme.of(context).primaryColor : Colors.white, height: 10),
                                  SizedBox(width: 10),
                                  Text(
                                    "Upgrade to Pro",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.isLightTheme ? Theme.of(context).primaryColor : Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [CircularProgressIndicator()]),
          ),
        );
      },
    );
  }
}
