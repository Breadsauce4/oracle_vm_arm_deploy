# [Get “Always Free” VM instance in Oracle Cloud, and Solve “Out of Host Capacity” Issue: The Easy Way — Part 2](https://medium.com/@me69oshan/get-always-free-vm-instance-in-oracle-cloud-and-solve-out-of-host-capacity-issue-the-easy-way-88babae4eae5)

**Mehedi Ehteshum**

*3 min read*

![image](https://github.com/user-attachments/assets/b3395f19-266f-4701-956c-39c436cad35d)

Following [Part-1](https://medium.com/@me69oshan/get-always-free-vm-and-other-services-in-oracle-cloud-and-solve-out-of-host-capacity-issue-cab001a44719), Since these offerings are gaining popularity, it is becoming increasingly difficult to avail of some free resources like _Arm-based Ampere A1 cores VMs_, especially in popular regions. You’ll likely end up getting the _“Out of Host Capacity”_ issue since they depend on availability.

I used the Frankfurt region. Comment if you know or find any other region where these resources are easily available.

Anyway, if the other methods mentioned in [Part 1](https://medium.com/@me69oshan/get-always-free-vm-and-other-services-in-oracle-cloud-and-solve-out-of-host-capacity-issue-cab001a44719) are not feasible for you and you are not in a hurry, you can prepare this automation script following the steps below, and try until you find an available slot.

## Steps

We’ll complete most of our tasks utilizing the Oracle resources and Oracle cloud shell. That is, we’ll run the final automation script on the cloud shell instead of running it on our local machine. Smart, eh? ;)

1. First, sign up for the Oracle Cloud free tier and log in to your Cloud account.
2. You can use either the root compartment or create a new one. I created a new one (`(root)/Compartment-free-full`) to separate _Always Free_ Oracle Cloud services.
3. If you haven’t tried creating your first free VM instance, try it, even if you get the “Out of Host Capacity” error message. This action should, at least, create necessary networking instances (VNIC, VCN, subnet, IP addresses, etc.) which we will use later. Search `instances` > then `create instance`. [You can find the specs for my VM here](https://github.com/MehediEhteshum/oracle_vm_arm_deploy/blob/main/vm_details.txt). Note that I have used the full free capacity in a single VM instance. Remember to save the key files.
    (Do not worry if you see Oracle is showing some _estimated costs_, you’ll not be charged as long as you use free resources.)
4. Try to create the instance. If you see the error, use `save as stack` to save the VM spec settings.
5. Go to `Stacks` > Open the saved stack > Create a `Plan`.
6. When the Plan creation is successful, you see it gives you options to download `Terraform Configuration and Plan`. Download them.
7. [Update this script](https://github.com/MehediEhteshum/oracle_vm_arm_deploy/blob/main/script_oci.sh) using the specific values found in your `Terraform configuration and plan` files.
8. Go back to the Oracle cloud account. Open the `cloud shell`. Use the `settings` icon to upload the script file, or create a script file in the shell using the `nano` command and then paste the script in it. After saving the script file in the shell, make the file executable using the `chmod +x` command. [You can find the necessary commands here](https://github.com/MehediEhteshum/oracle_vm_arm_deploy/blob/main/shell_cmd.txt).

![image](https://github.com/user-attachments/assets/610020fb-d185-4bb8-89c7-30fc3b079187)

10. Use the `nano` command to create a public key file `vm/id_rsa.pub` and paste the public key into it that you downloaded earlier.
11. Voilà! Your automation script is ready to run. Run it. Now you’ll see that your script is trying to deploy the VM instance for you. Don’t worry - once it can deploy a VM instance successfully, it’ll stop.

## Conclusion

This way you can automate your VM deployment retries. Your automation script will keep trying for you while you can do your other work.

Alternatively, you can modify and prepare multiple Terraform config main.tf files for all of your available domains, upload them in the cloud shell, and [update this script](https://github.com/MehediEhteshum/oracle_vm_arm_deploy/blob/main/script.sh) accordingly. Then you can use this script similarly to run the automation. However, I’ll recommend using the first approach.

<h2>Support</h2>

☕☕☕ If this project helps you understand the concepts around the topic, please consider buying me a coffee
<br>
☕☕☕
<a href="https://coindrop.to/mehedi_ehteshum" target="_blank"><img src="https://coindrop.to/embed-button.png" style="border-radius: 10px; height: 57px !important;width: 229px !important;" alt="Coindrop.to me"></img></a>
