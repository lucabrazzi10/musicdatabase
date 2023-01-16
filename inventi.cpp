#include <iostream>
#include <fstream>
using namespace std;

ofstream output;


class Milk {
private:
    int iD, Size;
    string Brand, Man_date, Exp_date;
public:
    Milk (){}
    Milk (int id, int size, string mandate, string expdate, string brand){
        iD = id;
        Brand = brand;
        Size = size;
        Man_date = mandate;
        Exp_date = expdate;
    }
    int getiD(){
        return iD;
    }
    void displayMilkinfo()
    {
        cout<<"Milk ID: "<<iD<<endl;
        cout<<"Brand: "<<Brand<<endl;
        cout<<"Size: "<<Size<<endl;
        cout<<"Manufacturing Date: "<<Man_date<<endl;
        cout<<"Expiry Date: "<<Exp_date<<endl;
        cout<<"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"<<endl;
        cout<<endl;
    }
    void WriteToFile()
    {
        output<<"Milk ID: "<<iD<<endl;
        output<<"Brand: "<<Brand<<endl;
        output<<"Size: "<<Size<<endl;
        output<<"Manufacturing Date: "<<Man_date<<endl;
        output<<"Expiry Date: "<<Exp_date<<endl;
        output<<"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"<<endl;
        output<<endl;
    }
};
struct MilkNode{
    Milk data;
    MilkNode* next;
    MilkNode* prev;
};
MilkNode* root = NULL;
//the list to which the objects will be saved in queues and trees
class MilkLinkedList {
private:
    MilkNode* head;
    MilkNode* tail;
    int counter;
    void AddLeafPrivate(Milk obMilk, MilkNode* Ptr)
    {
        if(root == NULL)
        {
            root = CreateLeaf(obMilk);
        }
        else if(obMilk.getiD() < Ptr -> data.getiD())
            {
                if(Ptr->prev != NULL){
                    AddLeafPrivate(obMilk, Ptr->prev);
                }
                else
                {
                    Ptr-> prev = CreateLeaf(obMilk);
                }
            }
        else if(obMilk.getiD() > Ptr -> data.getiD())
        {
            if(Ptr->next != NULL){
                AddLeafPrivate(obMilk, Ptr->next);
            }
            else
            {
                Ptr-> next = CreateLeaf(obMilk);
            }
        }
        else
        {
            cout<<"The Milk Item with ID "<< obMilk.getiD()<<" has already been added"<<endl;
        }
    };
    void PrintInOrderPrivate(MilkNode* Ptr)
    {
        if(root != NULL)
        {
            if(Ptr -> prev != NULL)
            {
                PrintInOrderPrivate(Ptr->prev);
            }
            Ptr->data.displayMilkinfo();
            if(Ptr -> next != NULL)
            {
                PrintInOrderPrivate(Ptr->next);
            }
        }
        else
        {
            cout<<"The Inventory is Empty"<<endl;
        }
       
    }
    void DeleteleftPrivate(MilkNode* Ptr)
           {
               if(root != NULL)
                      {
                          if(Ptr -> prev != NULL)
                          {
                              DeleteleftPrivate(Ptr->prev);
                          }
                          else
                               delete Ptr-> prev;
                      }
                      else
                      {
                          cout<<"The Inventory is Empty"<<endl;
                      }
           }
    
public:
    MilkLinkedList (){
    counter = 0;
    head = NULL;
    tail = NULL;
    }
    MilkNode* CreateLeaf(Milk data)
    {
        MilkNode* n = new MilkNode;
        n -> data = data;
        n -> prev = NULL;
        n -> next = NULL;
        return n;
    }
    void AddLeaf(Milk obMilk)
    {
        AddLeafPrivate(obMilk, root);
    }
    void PrintInOrder()
    {
        PrintInOrderPrivate(root);
    }
    // saving data to the queue
    void enqueue(Milk obmilk)
    {
        counter++;
        MilkNode* x = new MilkNode();
        x->data = obmilk;
        x->next = NULL;
        // check if this is the first node or not
        if (head == NULL) // this is an empty list, x would be the head and the tail
        {
            head = x;
            tail = x;
        }
        else  // make x as the tail and keep the head as it is
        {
            tail->next = x;
            tail = x;
        }
    }
    // dequeue missing
    void dequeue(){
        if(head != NULL){
        MilkNode* j = head;
        head = j ->next;
        counter --;
        cout<<"Your oldest Milk has been deleted!"<<endl;
        delete j;
        }
    }
    // checking if queue is empty
    bool IsEmpty(){
        if (head == NULL && tail == NULL)
            return true;
        else
            return false;
    }
    //shows the inventory list
    void showlist()
    {
        MilkNode *i = head;
        if (IsEmpty())
            cout<<"Your Inventory is Empty"<<endl;
        else
        {
        while (i != NULL)
        {
            i->data.displayMilkinfo();
            i = i->next;
        }
        }
    }
    //displaying an item's info
    void search_item(int a){
        MilkNode* current = head;
        while(current != NULL){
            if(current -> data.getiD() == a){
            current -> data.displayMilkinfo();
                break;
        }
            current = current->next;
        }
    }
    void checkforitem(int b)
    {
        MilkNode* current = head;
        
        while (current != NULL)
        {
            if (current->data.getiD() == b)
            {
                cout << "This Milk is available!" << endl;
                break;
            }
            current = current->next;
        }
    }
    //method not completed
    void deleteleft()
    {
        DeleteleftPrivate(root);
    }
       
};
int main(){
    
    MilkLinkedList list;
    string file;
    char option, ans;
    int iD, Size, item;
    string Brand, Man_date, Exp_date;
    //ifstream input;
    
    output.open("Files.txt");
   
    cout<<"          ***** Welcome to Your Inventory ***** "<<endl;
    cout<<endl;
    cout<<"       Please select your action from options below"<<endl;
    cout<<endl;
    cout<<"           To ADD NEW INVENTORY enter N"<<endl;
    cout<<"           To DELETE INVENTORY enter X"<<endl;
    cout<<"           To SEE YOUR INVENTORY enter D"<<endl;
    cout<<"           To SEARCH FOR IVENTORY enter S"<<endl;
    cout<<"           To DISPLAY INFO FOR ITEM enter I"<<endl;
    cout<<endl;
    
    do
       {
        cout<<"Enter Your option Here: ";
    cin>>option;
        
        
    switch (option)
    {
        case 'N':
        case 'n':
        {
            cout<<"Please enter your milk details in this order"<<endl;
            cout<<"Id, Size, Brand, Manufacturing date and Expiry date; all separated by a space"<<endl;
            cout<<endl;
            cin>>iD>> Size>>Brand>> Man_date>> Exp_date;
            Milk myMilk(iD, Size, Man_date, Exp_date, Brand);
                list.enqueue(myMilk);
            list.AddLeaf(myMilk);
            myMilk.WriteToFile();
            cout<<"Entered Successfully"<<endl;
            cout<<endl;
                break;
        }
        case 'X':
        case 'x':
                 list.dequeue();
                 list.deleteleft();
            break;
        case 'D':
        case 'd':
                list.PrintInOrder();
            break;
        case 'S':
        case 's':
            {
                cout<<"Please enter the Id number of the item you want to display"<<endl;
                cin>>item;
                list.checkforitem(item);
            }
            break;
        case 'I':
        case 'i':
        {
            cout<<"Please enter the Id number of the item you want to display"<<endl;
            cin>>item;
            list.search_item(item);
        }
            break;
    }
        cout<<"Perform another operation? (y/n)"<<endl;
        cin>>ans;
    }while(ans == 'Y' || ans == 'y');
    
    cout<<"  ********** THANK YOU!  **********"<<endl;
  
    output.close();
    
    return 0;
}

