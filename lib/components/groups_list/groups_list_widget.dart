import '/backend/backend.dart';
import '/components/empty_lists/component_empty_list_view/component_empty_list_view_widget.dart';
import '/components/rows/row_group/row_group_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'groups_list_model.dart';
export 'groups_list_model.dart';

class GroupsListWidget extends StatefulWidget {
  const GroupsListWidget({
    super.key,
    required this.memberships,
  });

  final List<MembersRecord>? memberships;

  @override
  State<GroupsListWidget> createState() => _GroupsListWidgetState();
}

class _GroupsListWidgetState extends State<GroupsListWidget> {
  late GroupsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GroupsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final memberships = widget.memberships!.toList();
        if (memberships.isEmpty) {
          return ComponentEmptyListViewWidget(
            emptyText: 'No groups',
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: memberships.length,
          itemBuilder: (context, membershipsIndex) {
            final membershipsItem = memberships[membershipsIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (membershipsItem.groupRef != null) {
                  _model.fetchedGroup = await GroupsRecord.getDocumentOnce(
                      membershipsItem.groupRef!);
                  if (_model.fetchedGroup?.reference != null) {
                    context.pushNamed(
                      PageGroupOverviewWidget.routeName,
                      queryParameters: {
                        'membership': serializeParam(
                          membershipsItem,
                          ParamType.Document,
                        ),
                        'groupRef': serializeParam(
                          _model.fetchedGroup?.reference,
                          ParamType.DocumentReference,
                        ),
                        'group': serializeParam(
                          _model.fetchedGroup,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'membership': membershipsItem,
                        'group': _model.fetchedGroup,
                      },
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Error'),
                          content:
                              Text('Could not load group. Try again later'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Could not load group. Try again later'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                }

                safeSetState(() {});
              },
              child: RowGroupWidget(
                key: Key('Keysq4_${membershipsIndex}_of_${memberships.length}'),
                membership: membershipsItem,
                isLastRow: false,
                hasNotifications: false,
              ),
            );
          },
        );
      },
    );
  }
}
