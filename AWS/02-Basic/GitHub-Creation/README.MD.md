
# Generate a Personal Access Token (Classic) on GitHub

A personal access token (classic) is a way of authenticating your actions on the command line or using the API. However, GitHub recommends that you use fine-grained personal access tokens instead of personal access tokens (classic) whenever possible, as they are more secure and offer more control. For more information, see Managing your personal access tokens 

Step 1: Go to your GitHub settings

•  Log in to your GitHub account and click on your profile icon in the top-right corner.

•  Select Settings from the drop-down menu.

•  Click on Developer settings in the left sidebar.

Step 2: Generate a new token

•  Click on Personal access tokens in the left sidebar.

•  Click on Generate new token in the top-right corner.

•  Click on Generate new token (classic) at the bottom of the page.


Step 3: Enter a note and an expiration date

•  In the Note field, enter a descriptive name for your token, such as "My token for CLI".

•  To give your token an expiration date, select Expiration, then choose a default option or click on Custom to enter a date. For example, you can choose 7 days to make your token expire after a week.

•  Click on Generate token.

Step 4: Select the scopes and copy the token

•  Select the scopes that you want to grant to your token, such as repo and delete_repo. Be careful not to grant more permissions than necessary, as this can compromise your account security.

•  Copy the token to a secure place, such as a password manager. You will not be able to see it again.

Step 5: Use the token

•  You can use your personal access token in place of your password when authenticating to GitHub on the command line or with the API. For example, you can use it with the git command like this:

git clone https://<token>@github.com/<username>/<repo>.git

•  You can also revoke your personal access token at any time by going to your GitHub settings and clicking on Delete next to the token.
