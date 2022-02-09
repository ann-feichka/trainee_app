import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/string_constants.dart';
import 'package:movie_app/view/widget/card/company_card.dart';

class CompaniesWidget extends StatelessWidget {
  final List<Company> companies;
  const CompaniesWidget({Key? key, required this.companies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          StringConstants.companies,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: companies.length,
            itemBuilder: (context, index) =>
                CompanyCard(company: companies[index]),
          ),
        )
      ],
    );
  }
}
