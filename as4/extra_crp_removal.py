file_name="Board3_10K_2_S4.txt"
count=1
g=""
e=[]
x=[]
for i in range(10001):
    e.append("")
with open(file_name,"r") as file:
    File_data=file.readlines()
    for line in File_data:
        count=count+1
        if(count%2==0):
            w=str(line)
            sub1 = "challenge"
            sub2 = ":"
            res = ''.join(w.split(sub1)[1].split(sub2)[0])
            res=int(res)
            x.append(res)
            g=g+str(line)
            #print(res)
        else:
            g=g+""+str(line)
            if(res<10001):
                e[res]=g 
                
                
            g=""
#print(e)   
f=open("abc.txt","w")
f.writelines(e)         
f.close()

# pok=[]
# for i in range(len(x)):
#     if(x.count(x[i])>1):
#         pok.append(x[i])
# print(len(pok))
