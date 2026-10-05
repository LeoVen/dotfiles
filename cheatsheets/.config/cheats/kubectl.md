# kubectl

---

Run all cronjobs

    $ kubectl get cronjob -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' | xargs -I {} kubectl create job --from=cronjob/{} {}-manual-$(date +%s)

---
