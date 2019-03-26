using System;
using System.Collections.Generic;
using System.IO;//引入IO
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace IO
{
    class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine(File.Exists(@"C:\HelloIO\IO.txt"));
            //判断文件是否存在，是返回True，否返回False
            //Console.WriteLine(Directory.Exists(@"C:\"));
            //判断文件夹是否存在，是返回True，否返回False

            string path = ".";
            if(args.Length>0)
            {
                if(Directory.Exists(args[0]))
                {
                    path = args[0];
                }
                else
                {
                    Console.WriteLine("{0} not found;using current dirrectory:",args[0]);
                }
            }
            DirectoryInfo dir=new DirectoryInfo(path);
            foreach (FileInfo f in dir.GetFiles("*.exe"))
            {
                string name = f.Name;
                long size = f.Length;
                DateTime creationTime = f.CreationTime;
                Console.WriteLine("{0,-12:NO}{1,-20:g}{2}",size,creationTime,name);
                //{0,-12:NO}有误
            }
            Console.ReadLine();
        }
    }
}
