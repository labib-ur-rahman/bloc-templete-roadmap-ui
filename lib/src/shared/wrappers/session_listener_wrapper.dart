import 'package:bloc_template_roadmap_ui/src/imports/core_imports.dart';
import 'package:bloc_template_roadmap_ui/src/imports/packages_imports.dart';

import 'package:bloc_template_roadmap_ui/src/features/auth/presentation/providers/session_bloc.dart';

class SessionListenerWrapper extends StatelessWidget {
  final Widget child;
  const SessionListenerWrapper({super.key, required this.child});

  void _handleSessionState(SessionState state) {
    if (state.status == SessionStatus.unknown) {
      return;
    }

    FlutterNativeSplash.remove();

    if (state.status == SessionStatus.authenticated) {
      appRouter.go(AppRoutes.home);
    } else if (state.status == SessionStatus.unauthenticated) {
      appRouter.go(AppRoutes.roadmap);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = context.watch<SessionBloc>().state;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleSessionState(sessionState);
    });

    return BlocListener<SessionBloc, SessionState>(
      listenWhen: (prev, next) => prev.status != next.status,
      listener: (context, state) {
        _handleSessionState(state);
      },
      child: child,
    );
  }
}
