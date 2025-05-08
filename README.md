# Build2025-OD861
Building with the Microsoft Intune SDK: Securing Hello World
## HelloWorld to Integrate with Intnune using loginandEnrollAccount 
#### Apps that don't sign in the user using MSAL can still receive app protection policy from the Intune MAM service by calling the API to have the SDK handle that authentication. Apps should use this technique when they haven't authenticated a user with Azure AD but still need to retrieve app protection policy to help protect data. To do this, the application can call the loginAndEnrollAccount method on the IntuneMAMEnrollmentManager instance: 
     IntuneMAMEnrollmentManager.instance().loginAndEnrollAccount() 
> [!NOTE]
> : Your application will always require a App Protection Policy when using this method.<br>
> ref: How to create a APP policy -https://learn.microsoft.com/mem/intune/developer/app-sdk-ios-phase3#first-policy-application-test

<br> :thought_balloon:	More About Apps that don't use ADAL or MSAL
<br>
Ref:
<br> 
https://learn.microsoft.com/en-us/mem/intune/developer/app-sdk-ios-phase3#apps-that-dont-use-adal-or-msal
<br>
<br>
<table aria-label="Table 3" class="table table-sm margin-top-none">
<thead>
<tr>
<td>By calling this method, the SDK will prompt the user for credentials if no existing token can be found. The SDK will then try to enroll the app with the Intune MAM service on behalf of the supplied user account. The method can be called with "nil" as the identity. In that case, the SDK will enroll with the existing managed user on the device (in the case of MDM), or prompt the user for a user name if no existing user is found.

If the enrollment fails, the app should consider calling this API again at a future time, depending on the details of the failure. The app can receive notifications, via a delegate, about the results of any enrollment requests.

After this API has been invoked, the app can continue functioning as normal. If the enrollment succeeds, the SDK will notify the user that an app restart is required. Once the app is managed, the Entra object ID value needs to be queried using enrolledAccountId in the IntuneMAMEnrollmentManager. Use this for all the MAM SDK APIs that the app uses for this enrolled account.</td>
</tr>

</tbody>
</table>
