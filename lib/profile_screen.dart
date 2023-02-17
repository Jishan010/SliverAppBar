import 'package:beamer/beamer.dart';
import 'package:connect_brcm/di/injector.dart';
import 'package:core/core.dart';
import 'package:core/utils/size_calculator.dart';
import 'package:domain/entities/auth/user_detailed_profile_entity.dart';
import 'package:domain/usecases/get_detailed_user_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../login/widgets/loading_indicator_widget.dart';
import 'bloc/detailed_user_profile_bloc.dart';

class ProfileDetailPage extends StatelessWidget {
  ProfileDetailPage({super.key});

  var _top = 0.0;
  final DetailedUserProfileBloc bloc = DetailedUserProfileBloc(
      useCase: getIt<GetDetailedUserProfileUseCase>(),
      networkInfo: getIt<NetworkInfo>(),
      preference: getIt<SharedPreferenceService>());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(InitialDetailedUserProfileEvent()),
      child: BlocListener<DetailedUserProfileBloc, DetailedUserProfileState>(
        listener: (context, state) {
          if (state is DetailedUserProfileFailureState) {
            if (state.errorCode == AppConstants.codeAuthenticationError) {
              ErrorOverlay(
                onTapAction: () => Beamer.of(context).beamBack(),
              ).displayErrorDialog(state.errorCode, context, isPopback: true);
            } else {
              ErrorOverlay(
                onTapAction: () => Beamer.of(context).beamBack(),
              ).displayErrorDialog(
                state.errorCode,
                context,
                isPopback: true,
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: ColorConstants.brcGrey2,
          body: BlocBuilder<DetailedUserProfileBloc, DetailedUserProfileState>(
            builder: (context, state) {
              if (state is DetailedUserProfileLoadingState) {
                return const Center(child: LoadingIndicator());
              } else if (state is DetailedUserProfileSuccessState) {
                DetailedUserEntity detailedUserEntity = state.detailedUserEntity;
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: ColorConstants.white,
                        statusBarIconBrightness: Brightness.dark,
                        // For Android (dark icons)
                        statusBarBrightness: Brightness.light, // For iOS (dark icons)
                      ),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: Container(
                          height: AppConstants.appBarDividerHeight,
                          decoration: const BoxDecoration(
                            color: ColorConstants.brcRed,
                          ),
                        ),
                      ),
                      centerTitle: false,
                      leading: BackButton(
                        color: ColorConstants.black,
                        onPressed: () {
                          Beamer.of(context).beamBack();
                        },
                      ),
                      titleSpacing: 0,
                      pinned: true,
                      expandedHeight:
                          SizeCalculator.getAvailableScreenHeight(context, value: 0.320),
                      flexibleSpace: LayoutBuilder(
                        builder: (context, BoxConstraints constraints) {
                          _top = constraints.biggest.height;

                          return FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            centerTitle: false,
                            titlePadding: const EdgeInsetsDirectional.only(
                                bottom: 17.0, top: 15.0, start: 50.0),
                            title: AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                                opacity: _top == MediaQuery.of(context).padding.top + kToolbarHeight
                                    ? 1.0
                                    : 0.0,
                                child: Text(StringConstants.myProfile,
                                    style: Styles.h5SemiBold
                                        .merge(const TextStyle(color: ColorConstants.black)))),
                            background: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 45,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorConstants.secondaryRed,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${detailedUserEntity.firstName?.substring(0, 1)}${detailedUserEntity.lastName?.substring(0, 1)}',
                                          style: Styles.h1SemiBold
                                              .merge(const TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${detailedUserEntity.firstName} ${detailedUserEntity.lastName}',
                                      style: Styles.h2SemiBold,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      detailedUserEntity.title ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400, fontSize: 18.0),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    SizeCalculator.getAvailableScreenHeight(context, value: 0.300),
                                width: double.infinity,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  color: Colors.white,
                                  margin: const EdgeInsets.all(16),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Text(
                                            'Contact',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        contactRowWidget(
                                            icon: Icons.email,
                                            value: detailedUserEntity.email ?? ''),
                                        const SizedBox(height: 12),
                                        contactRowWidget(
                                            icon: Icons.phone,
                                            value: detailedUserEntity.mobilePhone ?? ''),
                                        const SizedBox(height: 12),
                                        contactRowWidget(
                                            icon: Icons.location_on,
                                            value: detailedUserEntity.location ?? ''),
                                      ],
                                    ),
                                  ),
                                )),
                            SizedBox(
                                height:
                                    SizeCalculator.getAvailableScreenHeight(context, value: 0.490),
                                width: double.infinity,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  color: Colors.white,
                                  margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: Text('My Information',
                                              style: TextStyle(
                                                  fontSize: 16, fontWeight: FontWeight.bold)),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        informationColumnWidget(
                                            label: 'Designation',
                                            value: detailedUserEntity.title ?? ''),
                                        informationColumnWidget(
                                            label: 'Employee ID',
                                            value: detailedUserEntity.employeeNumber ?? ''),
                                        informationColumnWidget(
                                            label: 'Division',
                                            value: detailedUserEntity.division ?? ''),
                                        informationColumnWidget(
                                            label: 'Employee Type',
                                            value: detailedUserEntity.workerType ?? ''),
                                        informationColumnWidget(
                                            label: 'Manager Name',
                                            value:
                                                '${detailedUserEntity.managerFirstName} ${detailedUserEntity.managerLastName}'),
                                      ],
                                    ),
                                  ),
                                )),
                            Container(
                              height:
                                  SizeCalculator.getAvailableScreenHeight(context, value: 0.240),
                              color: ColorConstants.transparent,
                              width: double.infinity,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }

  Widget contactRowWidget({required IconData icon, required String value}) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Text(value),
      ],
    );
  }

  Widget informationColumnWidget({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12.0)),
        const SizedBox(
          height: 4,
        ),
        Text(value, style: const TextStyle(fontSize: 14.0)),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
