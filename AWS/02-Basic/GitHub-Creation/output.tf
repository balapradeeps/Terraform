/* Getting output data go to tfstate file 
and get the detailes like html_url, git_clone_url */

#https clone url
output "git_repo_html_url" {
  value = github_repository.example.html_url
}


#ssh clone url 
output "git_repo_clone_url" {
  value = github_repository.example.git_clone_url
}