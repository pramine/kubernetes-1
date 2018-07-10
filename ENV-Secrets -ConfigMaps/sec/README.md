## Secret

A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. 
Such information might otherwise be put in a Pod specification or in an image; 
putting it in a Secret object allows for more control over how it is used, and reduces the risk of accidental exposure.

You can create secret in multiple ways<br>

Creating a Secret Using kubectl create secret

```
# Create files needed for rest of example.
]#echo -n 'admin' > ./username.txt
]#echo -n '1f2d1e2e67df' > ./password.txt

]#kubectl create secret generic db-user-pass --from-file=./username.txt --from-file=./password.txt
secret "db-user-pass" created
```

Creating a Secret Manually
```
]#echo -n 'admin' | base64
YWRtaW4=
]#echo -n '1f2d1e2e67df' | base64
MWYyZDFlMmU2N2Rm
```

The above secret which we created is used in our secret.yaml

