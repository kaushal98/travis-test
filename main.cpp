#include <iostream>
#include <queue>
using namespace std;

typedef struct node{
    int a;
    node *next;
    node *left;
}node;

node* create(){
    node *n = new node;
    if(n == NULL){
        std::cout << "Dynamic memory alloc error" << endl;
        return NULL;
    }
    return n;
}

void append(node *root, node *p){
    node *r = root;
    while(r->next != NULL){
        r = r->next;
    }
    r->next = p;
}

node* prepend(node *root, node *p){
     node *head = root;
     p->next = root;
     head = p;
     return head;
}

void printNodes(node *root){
    node *r = root;
    while (r != NULL){
        std::cout << "Value is " << r->a << "\t";
        r = r->next;
    }
}

void sortList(node * root){
    node * head = root;
    while(root != NULL){
        node *nextp = root->next;
        if(nextp->a < root->a){
            int tmp = nextp->a;
            root->a = nextp->a;
        }else{

        }
    }
}

void reverseList(node *root){
    node* currNode = root;
    node* nextNode = NULL;
    node* prevNode = NULL;

    while(currNode != NULL){
        nextNode = currNode->next;
        currNode->next = prevNode;
        prevNode = currNode;
        currNode = nextNode;
        //std::cout << "XValue is " << currNode->a << "\t";
    }
    root = prevNode;
}

void printBFS(node *root){
  std::queue<node *> q;
  q.push(root);

  while(q.size() > 0){
    int levelNodes = q.size();
    while(levelNodes > 0){
      node *p = q.front();
      q.pop();
      std::cout << " " << p->a;
      if(p->left != NULL) q.push(p->left);
      if(p->next != NULL) q.push(p->next);
      levelNodes--;
    }
    cout << endl;
  }
}


// To execute C++, please define "int main()"
int main() {
    const char *words[] = { "Hello, ", "World!", "\n" };
    for(int i = 0; i < 3; i++){
        std::cout << words[i];
    }

    char str[] = "mera joota hein Japani";
    char *head = str;
    char *tail = str + strlen(str) - 1;

    std::cout << string(str) << endl;
    while(tail > head){
        char tmp;
        tmp = *tail;
        *tail = *head;
        *head = tmp;
        head++; tail--;
    }
    std::cout << string(str) << endl;

    node *root = new node;
    root->a = 0;
    root->next = NULL;

    node *n = new node[15];
    for(int i = 0; i < 15; i++){
        n[i].a = i+1;
        n[i].next = NULL;
        append(root, &n[i]);
    }

    // prepend
    node *n1 = create();
    n1->a = 11;
    n1->next = NULL;

    std::cout << "Prepending.." << endl;
    //root = prepend(root, n1);
    //printNodes(root);

    reverseList(root);
    printNodes(root);

    //free list memory
    delete[] n;
    delete root;
    delete n1;

    return 0;
}
