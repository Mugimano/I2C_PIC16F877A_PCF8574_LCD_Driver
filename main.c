#include<pic.h>
#define _XTAL_FREQ 20000000

#define RS RB1
#define EN RB2
#define led RB0


void I2C_Master_start();
void I2C_Master_write(unsigned int data);
void I2C_Master_stop();
unsigned short I2C_Master_Read(char data);

void lcd_send_cmd (unsigned char data);
void lcd_send_data (unsigned char data);
void lcd_init (void);
void I2C_init();
void lcd_send_string (char *str);

unsigned int a,sum;
void I2C_Master_RepeatedStart();

void main()
{
TRISC = 0Xff;
PORTC = 0X00;

TRISB = 0X00;
PORTB = 0X00;

TRISD = 0X00;
PORTD = 0X00;


I2C_init (100000);  // initialise I2C at 100KHz
    lcd_init ();
    
    lcd_send_string ("MUGESH");

 while(1){ 
}
}

void I2C_init()
{
SSPSTAT = 0x00;      // Slew rate enables for high speed
SSPCON = 0b00101000; // Hex value is 0x28
SSPADD = 0x3F;        //Speed 100Khz
}

 void lcd_send_cmd (unsigned char data)
{
 unsigned char data_l, data_u;
 data_l = (data<<4)&0xf0;  //select lower nibble by moving it to the upper nibble position
 data_u = data&0xf0;  //select upper nibble

 I2C_Master_start();
 I2C_Master_write (0x42);
 I2C_Master_write (data_u|0x0C);  //enable=1 and rs =0
 I2C_Master_write(data_u|0x08);  //enable=0 and rs =0

 I2C_Master_write(data_l|0x0C);  //enable =1 and rs =0
 I2C_Master_write(data_l|0x08);  //enable=0 and rs =0

 I2C_Master_stop();
}

void lcd_send_data (unsigned char data)
{
 unsigned char data_l, data_u;
 data_l = (data<<4)&0xf0;  //select lower nibble by moving it to the upper nibble position
 data_u = data&0xf0;  //select upper nibble

 I2C_Master_start();
 I2C_Master_write (0x42);
 I2C_Master_write (data_u|0x0D);  //enable=1 and rs =1
 I2C_Master_write (data_u|0x09);  //enable=0 and rs =1

 I2C_Master_write (data_l|0x0D);  //enable =1 and rs =1
 I2C_Master_write (data_l|0x09);  //enable=0 and rs =1

 I2C_Master_stop();
}

void lcd_send_string (char *str)
{
 while (*str) lcd_send_data (*str++);
}

void lcd_init (void)
{
 lcd_send_cmd (0x02);
 lcd_send_cmd (0x28);
 lcd_send_cmd (0x0c);
 lcd_send_cmd (0x80);
}

void I2C_Master_start()
{
SEN = 1;
while(SSPIF == 0);
SSPIF = 0;
}

void I2C_Master_stop()
{
PEN = 1;
while(SSPIF == 0);
SSPIF = 0;
}

void I2C_Master_RepeatedStart()
{
  RSEN = 1;
  while(SSPIF==0);
  SSPIF=0;
}

void I2C_Master_write(unsigned int data)
{
SSPBUF = data;
while(SSPIF == 0);
SSPIF = 0;
}


unsigned short I2C_Master_Read(char data)
{
  unsigned long int temp;
  RCEN = 1;
  while(SSPIF==0);
  SSPIF=0;
  temp = SSPBUF; 
  if(data==0)
   ACKDT =0;
  else
   ACKDT =1;
  ACKEN = 1;
  while(SSPIF==0);
  SSPIF=0;
  return temp;
}

