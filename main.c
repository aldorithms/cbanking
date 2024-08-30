#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Structure to store account information
struct Account {
    int accountNumber;
    char name[100];
    float balance;
};

// Function to create a new account
void createAccount(struct Account *acc) {
    printf("Enter account number: ");
    scanf("%d", &acc->accountNumber);
    printf("Enter account holder's name: ");
    scanf("%s", acc->name);
    acc->balance = 0.0;
    printf("Account created successfully!\n");
}

// Function to deposit money
void deposit(struct Account *acc) {
    float amount;
    printf("Enter amount to deposit: ");
    scanf("%f", &amount);
    acc->balance += amount;
    printf("Amount deposited successfully! New balance: %.2f\n", acc->balance);
}

// Function to withdraw money
void withdraw(struct Account *acc) {
    float amount;
    printf("Enter amount to withdraw: ");
    scanf("%f", &amount);
    if (amount > acc->balance) {
        printf("Insufficient balance!\n");
    } else {
        acc->balance -= amount;
        printf("Amount withdrawn successfully! New balance: %.2f\n", acc->balance);
    }
}

// Function to check account balance
void checkBalance(struct Account *acc) {
    printf("Account Balance: %.2f\n", acc->balance);
}

// Function to display account details
void displayAccount(struct Account *acc) {
    printf("\nAccount Details:\n");
    printf("Account Number: %d\n", acc->accountNumber);
    printf("Account Holder's Name: %s\n", acc->name);
    printf("Account Balance: %.2f\n", acc->balance);
}

// Function to save account data to a file
void saveToFile(struct Account *acc) {
    FILE *file = fopen("accounts.txt", "a"); // Open file in append mode
    if (file == NULL) {
        printf("Error opening file!\n");
        return;
    }
    fprintf(file, "%d %s %.2f\n", acc->accountNumber, acc->name, acc->balance);
    fclose(file);
    printf("Account details saved to file.\n");
}

// Function to load account details from file
void loadFromFile(struct Account *acc) {
    FILE *file = fopen("accounts.txt", "r"); // Open file in read mode
    if (file == NULL) {
        printf("No account data found.\n");
        return;
    }
    while (fscanf(file, "%d %s %f", &acc->accountNumber, acc->name, &acc->balance) != EOF) {
        displayAccount(acc);
    }
    fclose(file);
}

int main() {
    struct Account acc;
    int choice;

    while (1) {
        printf("\n--- Banking System ---\n");
        printf("1. Create Account\n");
        printf("2. Deposit\n");
        printf("3. Withdraw\n");
        printf("4. Check Balance\n");
        printf("5. Display Account Details\n");
        printf("6. Save Account to File\n");
        printf("7. Load Account from File\n");
        printf("8. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                createAccount(&acc);
                break;
            case 2:
                deposit(&acc);
                break;
            case 3:
                withdraw(&acc);
                break;
            case 4:
                checkBalance(&acc);
                break;
            case 5:
                displayAccount(&acc);
                break;
            case 6:
                saveToFile(&acc);
                break;
            case 7:
                loadFromFile(&acc);
                break;
            case 8:
                printf("Exiting...\n");
                exit(0);
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }

    return 0;
}
