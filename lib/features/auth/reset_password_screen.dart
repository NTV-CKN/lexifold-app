import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexifold/l10n/app_localizations.dart';
import 'package:lexifold/utils/validator_utils.dart';

import '../../data/model/result/base_result.dart';
import '../../data/model/result/result_wrapper.dart';
import '../../providers/auth/auth_provider.dart';
import '../../utils/show_progress_dialog.dart';
import '../../utils/show_snackbar.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends ConsumerState<ResetPasswordScreen> {
  late final TextEditingController _emailController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit(AppLocalizations l10n) {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      ref
          .read(authNotifierProvider.notifier)
          .resetPassword(email, l10n);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    //listen signup
    ref.listen(authNotifierProvider, (prev, next) {
      //Tắt loading trước đó
      if (prev != null && prev.isLoading) {
        ShowProgressDialog.hideDialogLoading(context);
      }

      //Hiển thị progress loading
      if (next.isLoading) {
        ShowProgressDialog.showDialogLoading(context);
        return;
      }

      //Đăng nhập thành công
      if (next.hasValue && next.value is Success<BaseResult>) {
        final successData = next.value as Success<BaseResult>;
        if (successData.data.success) {
          ShowSnackbar.showBaseSnackbar(
            context,
            successData.data.message,
          );
        }
      }

      //Đăng nhập thất bại
      if (next.value != null && next.value is Error<BaseResult>) {
        final error = (next.value as Error).error;
        ShowSnackbar.showBaseSnackbar(context, error.toString());
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.textResetPassword)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.textExplainResetPassword,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _handleSubmit(l10n),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey.withAlpha(180),
                    ),
                    hintText: 'example@gmail.com',
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    return Validators.validateEmail(value, l10n);
                  },
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () => _handleSubmit(l10n),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    l10n.textSendRequest,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
